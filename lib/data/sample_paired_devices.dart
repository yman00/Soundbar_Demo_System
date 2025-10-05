enum DeviceStatus { connect, connected, offline }

class Device {
  final String deviceName;
  final String features;
  final DeviceStatus status;

  const Device({
    required this.deviceName,
    required this.features,
    this.status = DeviceStatus.connect,
  });

  // copyWith method to create a new Device with updated values
  Device copyWith({
    String? deviceName,
    String? features,
    DeviceStatus? status,
  }) {
    return Device(
      deviceName: deviceName ?? this.deviceName,
      features: features ?? this.features,
      status: status ?? this.status,
    );
  }
}

// Sample constant list
const List<Device> sampleDevices = [
  Device(
    deviceName: 'Sony HT-A9M2', 
    features: '4.0.4 channel system, with 16 speaker drivers'
  ),
  Device(
    deviceName: 'Sony BRAVIA-(A78KL)', 
    features: '7.1.2 channel system with subwoofer'
  ),
  Device(
    deviceName: 'Sony BT-BAR6', 
    features: '7.1.2 channel system with subwoofer'
  ),
  Device(
    deviceName: 'Sony HT-A9M2', 
    features: '4.0.4 channel system, with 16 speaker drivers'
  ),
  Device(
    deviceName: 'Sony BRAVIA-(A78KL)', 
    features: '7.1.2 channel system with subwoofer'
  ),
  Device(
    deviceName: 'Sony BT-BAR6', 
    features: '7.1.2 channel system with subwoofer'
  ),
];
